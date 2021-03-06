class Admin::UsStocksController < AdminController

  def index
    @us_stocks = UsStock.page(params[:page]).per(25)
  end

  def show
    @us_stock = UsStock.find_by_easy_symbol!(params[:id])
  end

  def new
    @us_stock = UsStock.new
  end

  def create
    @us_stock = UsStock.new(us_stock_params)

    if @us_stock.save
      redirect_to admin_us_stocks_path
    else
      render :new
    end
  end

  def edit
    @us_stock = UsStock.find_by_easy_symbol!(params[:id])
  end

  def update
    @us_stock = UsStock.find_by_easy_symbol!(params[:id])

    if @us_stock.update(us_stock_params)
      redirect_to admin_us_stocks_path
    else
      render :edit
    end
  end

  def destroy
    @us_stock = UsStock.find_by_easy_symbol!(params[:id])

    @us_stock.destroy
    redirect_to admin_us_stocks_path
  end


  private

  def us_stock_params
    params.require(:us_stock).permit(:symbol, :easy_symbol, :cnname, :market, :pinyin, :cwzb, :lrb, :llb, :zcb, :industry, :main_business, :company_url, :time_to_market, :version, :static_data, :sector, :ipoyear, :name)
  end

end
