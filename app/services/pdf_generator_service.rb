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
      encoding: 'UTF-8',
      # ページのサイズをCSSの設定を優先して使用する（@page規則など）
      preferCSSPageSize: true,
      # 背景色や背景画像を印刷に含める
      printBackground: true,
      # ヘッダーとフッターを非表示にする（ページ番号などが自動で付かなくなる）
      displayHeaderFooter: false,
      # 日本語フォントを指定
      font_family: 'IPAPGothic',
    )
    browser.quit
  end

end