class PdfGeneratorService
  
  def initialize(template_path, output_path)
    @template_path = template_path
    @output_path = output_path
  end

  def generate_pdf
    browser = Ferrum::Browser.new
    browser.goto("file://#{@template_path}") # ローカルのHTMLファイルを開く処理
    browser.add_style_tag(
      content: File.read("#{Rails.root}/app/assets/stylesheets/ky_sheets/show.scss")
    )
    browser.pdf(
      path: @output_path,
      format: :A4,
      landscape: true,
    )
    browser.quit
  end

end