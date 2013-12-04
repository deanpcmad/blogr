require "spec_helper"

describe Blogr::Post do
  
  it "has a valid factory" do
  	FactoryGirl.create(:blogr_post).should be_valid
  end

  it "is invalid without a title" do
  	FactoryGirl.build(:blogr_post, title: nil).should_not be_valid
  end

  it "is invalid without content" do
  	FactoryGirl.build(:blogr_post, content: nil).should_not be_valid
  end

  it "returns the title" do
  	post = FactoryGirl.build(:blogr_post, title: "Hello World")
  	post.title.should == "Hello World"
  end

  it "returns the content" do
  	post = FactoryGirl.build(:blogr_post, content: "Hello World, my name is Dean")
  	post.content.should == "Hello World, my name is Dean"
  end

  describe '::published' do
    it 'should have no publised posts' do
      Blogr::Post.published.count.should eq 0
    end

    context 'with unpublished post' do
      before { FactoryGirl.create(:blogr_post) }
      it 'should have no publised posts' do
        Blogr::Post.published.count.should eq 0
      end
    end

    context 'with published post' do
      before do
        FactoryGirl.create(
          :blogr_post,
          published: true,
          published_at: Date.today - 3.days
        )
      end

      it 'should have 1 publised post' do
        Blogr::Post.published.count.should eq 1
      end
    end

    context 'with published post in the future' do
      before do
        FactoryGirl.create(
          :blogr_post,
          published: true,
          published_at: Date.today + 3.days
        )
      end

      it 'should have 1 publised post' do
        Blogr::Post.published.count.should eq 0
      end
    end

    context 'with published post' do
      before do
        FactoryGirl.create(
          :blogr_post,
          published: true,
          published_at: Date.today - 3.days
        )
      end

      it 'should have 1 publised post' do
        Blogr::Post.published.count.should eq 1
      end
    end
  end

  describe 'tags' do
    before do
      FactoryGirl.create(:blogr_post, title: 'ab', permalink: 'ab', tag_list: 'a, b')
      FactoryGirl.create(:blogr_post, title: 'bc', permalink: 'bc', tag_list: 'b, c')
    end

    describe '::tagged_with' do
      it 'should select correct posts' do
        Blogr::Post.tagged_with('a').count.should eq 1
        Blogr::Post.tagged_with('b').count.should eq 2
        Blogr::Post.tagged_with('a').count.should eq 1
      end
    end

    describe '::tag_counts' do
      it 'should return correct counts' do
        tags = Blogr::Post.tag_counts
        tags[0].name.should  eq 'a'
        tags[0].count.should eq 1
        tags[1].name.should  eq 'b'
        tags[1].count.should eq 2
        tags[2].name.should  eq 'c'
        tags[2].count.should eq 1
      end
    end
  end

  describe 'post' do
    describe 'permalink' do
      it 'should use permalink from params' do
        post = FactoryGirl.build(:blogr_post, permalink: 'permalink')
        post.permalink.should eq 'permalink'
      end

      context 'no permalink' do
        it 'should create permalink from title' do
          post = FactoryGirl.build(:blogr_post, title: 'title', permalink: nil)
          post.permalink.should be_nil
          post.valid?
          post.permalink.should eq 'title'
        end
      end
    end

    let(:post) { FactoryGirl.create(:blogr_post) }
    subject    { post                            }

    describe '#date_parsed' do
      its(:date_parsed) { should eq '' }

      context 'published' do
        let(:post) do
          FactoryGirl.create(
            :blogr_post,
            published:    true,
            published_at: Date.new(2013, 12, 24).beginning_of_day
          )
        end

        its(:date_parsed) { should eq '24 December 2013' }
      end
    end

    describe '#content_rendered' do
      let(:post)             { FactoryGirl.create(:blogr_post, content: '## Awesome') }
      its(:content_rendered) { should eq '<h3>Awesome</h3>'                           }
    end

    describe '#tag_list' do
      let(:post)     { FactoryGirl.create(:blogr_post) }
      its(:tag_list) { should eq ''                    }

      context 'with tag' do
        before            { post.tag_list = "aa a, b_b, cCc" }
        its('tags.count') { should eq 3                      }
        its(:tag_list)    { should eq 'aa a, b_b, cCc'       }
      end
    end
  end
end