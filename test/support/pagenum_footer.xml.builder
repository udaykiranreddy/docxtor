xml.instruct! :xml, :version => "1.0", :encoding=>"UTF-8", :standalone => "yes"
xml.w :ftr, "xmlns:o" => "urn:schemas-microsoft-com:office:office",
"xmlns:r" => "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
"xmlns:v" => "urn:schemas-microsoft-com:vml",
"xmlns:w" => "http://schemas.openxmlformats.org/wordprocessingml/2006/main",
"xmlns:w10" => "urn:schemas-microsoft-com:office:word",
"xmlns:wp" => "http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" do |xml|

  xml.w :p do |xml|
    xml.w :pPr do |xml|
    end
    xml.w :r do |xml|
      xml.w :fldChar, "w:fldCharType" => "begin"
    end
    xml.w :r do |xml|
      xml.w :instrText, "PAGE"
    end
    xml.w :r do |xml|
      xml.w :fldChar, "w:fldCharType" => "separate"
    end
    xml.w :r do |xml|
      xml.w :t, "i"
    end
    xml.w :r do |xml|
      xml.w :fldChar, "w:fldCharType" => "end"
    end
  end
end



