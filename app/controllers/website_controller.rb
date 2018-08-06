class WebsiteController < ApplicationController
  def index
    @token = nil
  end

  def donate
    charity = Charity.find_by(id: params[:charity])
    if retrieve_token.present?
      unless params[:amount].blank? || params[:amount].to_i <= 20
        unless !charity
          if Rails.env.development?
            charge = OpenStruct.new({
              amount: params[:amount].to_i * 100,
              paid: (params[:amount].to_i != 999),
            })
          else
            charge = Omise::Charge.create({
              amount: params[:amount].to_i * 100,
              currency: "THB",
              card: params[:omise_token],
              description: "Donation to #{charity.name} [#{charity.id}]",
            })
          end
          if charge.paid
            charity.credit_amount(charge.amount)
          end
        else
          @token = retrieve_token
          flash.now.alert = t(".failure")
          render :index
          return
        end
      else
        @token = retrieve_token
        flash.now.alert = t(".failure")
        render :index
        return
      end
    else
      @token = nil
      flash.now.alert = t(".failure")
      render :index
      return
    end
    if !charity
      @token = nil
      flash.now.alert = t(".failure")
      render :index
      return
    end
    if charge.paid
      flash.notice = t(".success")
      redirect_to root_path
    else
      @token = nil
      flash.now.alert = t(".failure")
      render :index
    end
  end

  private

  def retrieve_token
    if Rails.env.development?
      OpenStruct.new({
        id: "tokn_X",
        card: OpenStruct.new({
          name: params[:name],
          last_digits: params[:cc_no].split(" ").last,
          expiration_month: params[:expiration_month],
          expiration_year: params[:expiration_year],
          security_code_check: true,
        }),
      })
    else
      nil
    end
  end
end
