namespace :simpleblog do
  desc "creates dummy data"

  task dummy: :environment do
    puts 'cleaning up data'
    Simpleblog::Category.delete_all
    Simpleblog::Post.delete_all
    Simpleblog::Image.delete_all

    relative_dir = "/../../dummy"
    dummy_dir = File.expand_path(__FILE__ + relative_dir)

    puts "creating categories"

    %w{Events News Tech Whatever}.each do |category|
      category = Simpleblog::Category.new title: category
      puts "#{category.title} created" if category.save!
    end


    puts "creating posts"
    YAML.load_file("#{dummy_dir}/posts.yml").each do |post_data|
      post = Simpleblog::Post.new post_data.slice!('images', 'categories')
      post.save!

      post_data['images'].each do |img_file|
        post.images << Simpleblog::Image.create!(file: File.new(File.expand_path(__FILE__ + relative_dir + "/images/#{img_file}")))
      end

      post_data['categories'].each do |category_data|
        post.categories << Simpleblog::Category.where(title: category_data)
      end

    end

  end
end
