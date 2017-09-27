# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = []
    lines = []
    tsv.each_line { |line| lines << line }
    keys = lines[0].split("\t")
    keys.map!(&:chomp)
    lines.shift
    get_hash(lines, keys)
    # puts "the value of data: #{@data}"
  end

  def get_hash(lines, keys)
    lines.each do |line|
      values = line.split("\t")
      students = {}
      keys.each_index { |index| students[keys[index]] = values[index].chomp }
      @data << students
    end
  end
  # to_tsv: converts @data into tsv string
  # returns: String in TSV format

  def to_tsv
    @data.to_s
  end
end
