class RemindersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer
  before_action :set_reminder, only: %i[ show edit update destroy close]

  # GET /reminders or /reminders.json
  def index 
    if @customer
      @reminders = @customer.reminders
    else  
      @reminders = Reminder.all
    end
    params[:filter_by] ||= 'today'
    case(params[:filter_by])
    when 'today'
      @reminders = @reminders.where(expiry_date: Date.today)
    when 'week'
      @reminders = @reminders.where(expiry_date: Time.now..(Time.now + 1.week))
    when 'month'
      @reminders = @reminders.where(expiry_date: Date.today..(Date.today + 1.month))
    end
    #@reminders = @reminders.paginate(page: params[:page], per_page: 1)
    @reminders = @reminders.paginate(page: params[:page], per_page: params[:per_page] || 5) 

  end

  # GET /reminders/1 or /reminders/1.json
  def show
  end

  def close
    @reminder.closed!
    # @reminder.status = "close"
    # @reminder.save
    if @customer 
      redirect_to customer_reminders_path(@customer)
    else
      redirect_to reminders_path
    end
  end

  # GET /reminders/new
  def new
    @reminder = Reminder.new
  end

  # GET /reminders/1/edit
  def edit
  end
  
  def print
    respond_to do |format|
      format.html{render "print",layout: false}
      format.pdf do
        render :pdf => "print",:margin => { :top => 5, :bottom => 5, :left => 10, :right => 4 }, :layout => 'pdf1.html'
      end
    end
  end

  # POST /reminders or /reminders.json
  def create
    if @customer
      @reminder = @customer.reminders.build(reminder_params)
    else
      @reminder = Reminder.new(reminder_params)
    end

    respond_to do |format|
      if @reminder.save
        format.html { redirect_to @reminder, notice: "Reminder was successfully created." }
        format.json { render :show, status: :created, location: @reminder }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reminders/1 or /reminders/1.json
  def update
    respond_to do |format|
      if @reminder.update(reminder_params)
        format.html { redirect_to @reminder, notice: "Reminder was successfully updated." }
        format.json { render :show, status: :ok, location: @reminder }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reminders/1 or /reminders/1.json
  def destroy
    @reminder.destroy
    respond_to do |format|
      format.html { redirect_to reminders_url, notice: "Reminder was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_customer
    @customer = Customer.find_by_id(params[:customer_id])
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_reminder
      @reminder = Reminder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reminder_params
      params.require(:reminder).permit(:reminder_type_id, :reminder_content, :expiry_date, :occurence, :customer_id )
    end

end