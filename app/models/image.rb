class Image < ApplicationRecord


  has_many :voterecords
  has_many :users, through: :voterecords




    def avatar_upload(file)
        root_path = "#{Rails.root}/public"
        dir_path = "/images/avatar/#{Time.now.strftime('%Y%m')}"
        final_path = root_path + dir_path
        if !File.exist?(final_path)
          FileUtils.makedirs(final_path)
        end
        file_rename = "#{Digest::MD5.hexdigest(Time.now.to_s)}#{file.original_filename}"
        file_path = "#{final_path}/#{file_rename}"
        File.open(file_path,'wb+') do |item| #用二进制对文件进行写入
          item.write(file.read)
        end
        self.url = "#{dir_path}/#{file_rename}"
        self.Votes = 0
        save
    end
end
