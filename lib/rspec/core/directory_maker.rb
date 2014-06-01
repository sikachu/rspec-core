class DirectoryMaker
  def self.mkdir_p(path)
    stack = []
    path.split(File::SEPARATOR).each do |part|
      if stack.empty? && part == ""
        stack << "/"
      else
        stack << part
      end
      begin
        Dir.mkdir(File.join(stack))
      rescue Errno::EISDIR
      rescue Errno::EEXIST
      end
    end
  end
end
