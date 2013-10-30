namespace :blogr do
  desc "creates dummy data"

  task dummy: :environment do
    puts 'cleaning up data'
    Blogr::Category.delete_all
    Blogr::Post.delete_all
    Blogr::Image.delete_all

    relative_dir = "/../../dummy"
    dummy_dir = File.expand_path(__FILE__ + relative_dir)

    puts "creating categories"

    %w{Events News Tech Whatever}.each do |category|
      category = Blogr::Category.new title: category
      puts "#{category.title} created" if category.save!
    end


    puts "creating posts"
    YAML.load_file("#{dummy_dir}/posts.yml").each do |post_data|
      post = Blogr::Post.new post_data.slice!('images', 'categories')
      post.save!

      post_data['images'].each do |img_file|
        post.images << Blogr::Image.create!(file: File.new(File.expand_path(__FILE__ + relative_dir + "/images/#{img_file}")))
      end

      post_data['categories'].each do |category_data|
        post.categories << Blogr::Category.where(title: category_data)
      end

    end

  end
end
