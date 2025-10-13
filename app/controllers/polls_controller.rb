class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :results, :vote, :qr_code, :close]
  
  def index
    @polls = Poll.order(created_at: :desc).limit(50)
  end

  def show
    if @poll.closed?
      redirect_to results_poll_path(@poll.share_code)
    elsif @poll.voted_by_ip?(request.remote_ip)
      redirect_to results_poll_path(@poll.share_code)
    end
  end

  def new
    @poll = Poll.new
    3.times { @poll.options.build }
  end

  def create
    @poll = Poll.new(poll_params)
    
    if @poll.save
      redirect_to poll_path(@poll.share_code), notice: 'Poll created successfully! Share the link to start collecting votes.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def results
    @chart_data = @poll.options.map { |opt| [opt.title, opt.vote_count] }
  end
  
  def vote
    if @poll.closed?
      redirect_to results_poll_path(@poll.share_code), alert: 'This poll is closed.'
      return
    end
    
    if !@poll.allow_multiple && @poll.voted_by_ip?(request.remote_ip)
      redirect_to results_poll_path(@poll.share_code), alert: 'You have already voted in this poll.'
      return
    end
    
    option = @poll.options.find(params[:option_id])
    vote = @poll.votes.build(option: option, voter_ip: request.remote_ip)
    
    if vote.save
      redirect_to results_poll_path(@poll.share_code), notice: 'Your vote has been recorded!'
    else
      redirect_to poll_path(@poll.share_code), alert: vote.errors.full_messages.join(', ')
    end
  end
  
  def qr_code
    require 'rqrcode'
    
    poll_url = poll_url(@poll.share_code)
    qr = RQRCode::QRCode.new(poll_url)
    
    svg = qr.as_svg(
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6,
      standalone: true,
      use_path: true
    )
    
    render inline: svg, content_type: 'image/svg+xml'
  end
  
  def close
    @poll.update(closes_at: Time.current)
    redirect_to results_poll_path(@poll.share_code), notice: 'Poll has been closed.'
  end
  
  private
  
  def set_poll
    @poll = Poll.find_by!(share_code: params[:id])
  end
  
  def poll_params
    params.require(:poll).permit(:title, :description, :closes_at, :allow_multiple, 
                                  options_attributes: [:id, :title, :_destroy])
  end
end
