class ExpensesController < ApplicationController
  
  def new
    @expense = Expense.new
  end

  def create
    @expense =  current_account.expenses.build(expense_params)
    if @expense.save
      redirect_to @expense, notice: 'Expense was successfully created.'
    else
      logger.debug "Expense didn't save because: #{@expense.errors.inspect}"
      render :new
    end
  end

  def expense_params
    params.require(:expense).permit(:amount, :merchant_name, :purchased_on, :category, :description, :receipt)
  end

  def show
    @expense = Expense.find(params[:id])
  end

end
