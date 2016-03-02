class Scraping
    # codeを入れてurlからそれぞれの株価を獲得した。
    def self.get_price1(brands)
        puts "move scrayping get_price1"
        agent=Mechanize.new
        brands.each do |brand|
            # Original
            #brand_page=agent.get("http://stocks.finance.yahoo.co.jp/stocks/detail/?code="+ brand.code)
            #price1=brand_page.at('.stocksTable stockPrice').inner_text
            # Refactoring
            brand_page=agent.get("http://stocks.finance.yahoo.co.jp/stocks/detail/?code="+ brand.code.to_s)
            if brand_page.present?
            end
            #if brand_page.present?
            # end
            # brand_page.seach('...')の結果がnilかチェックしたほうが良さげ
            price3=brand_page.at('.stoksPrice:nth-of-type(2)').inner_text.delete(',')
            price4=brand_page.at('.tseDtlDelay strong').inner_text.delete(',')
            # brands = Brand.where(:bland_name=>brand.brand_name)
            # brands.update_attribute(:price1,price1)
            
            brand.price3=price3
            brand.price4=price4
            brand.save
            puts brand
            puts "request done"
            # arr = [1,2,3,4]
            # flash[:arr] = arr
            # redirect_to :controller => "app", :action => "/update/last"
        end
    end
end