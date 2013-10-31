namespace :ckeditor do
  def copy_assets(regexp)
    Rails.application.assets.each_logical_path(regexp) do |name, path|
      asset = Rails.root.join('public', 'assets', name)
      p "Copy #{path} to #{asset}"
      FileUtils.mkdir_p File.dirname(asset)
      FileUtils.cp path, asset
    end
  end

  desc 'Copy ckeditor assets, that cant be used with digest'
  task copy_nondigest_assets: :environment do
    copy_assets(/ckeditor\/contents.css/)
    copy_assets(/ckeditor\/config.js/)
    copy_assets(/ckeditor\/lang\/en.js/)
    copy_assets(/ckeditor\/styles.js/)
    copy_assets(/ckeditor\/skins\/moono\/.+png/)
    copy_assets(/ckeditor\/skins\/moono\/.+css/)
  end
end

