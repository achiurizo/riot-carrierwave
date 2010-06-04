# riot-carrierwave

Riot macros for Carrierwave.

These macros have been mostly converted over from the included rspec matchers included in carrierwave.

## Examples

    context "my Uploader" do
      setup do
        Uploader.enable_processing = true
        @uploader = Uploader.new
        @uploader.store! File.open('picture.jpg')
        @uploader
      end
            
      asserts_topic.has_dimensions :equal, 30,30
      asserts_topic.has_dimensions :no_larger_than, 30, 30
      asserts_topic.has_dimensions :no_smaller_than, 20, 20
      asserts_topic.has_dimensions :larger_than, 30, 30
      asserts_topic.has_dimensions :smaller_than, 30, 30
      asserts_topic.has_permission 0777
      asserts_topic.identical_to 'picture.jpg'
      
    end

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Arthur Chiu. See LICENSE for details.
