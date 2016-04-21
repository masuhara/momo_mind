require 'opencv'
include OpenCV

input_file = ARGV[0]
data = ARGV[1]
#output_file = ARGV[2]

#data = './data/haarcascades/haarcascade_frontalface_alt.xml'
#data = 'cascade_fix.xml'

detector = CvHaarClassifierCascade::load(data)
image = CvMat.load(input_file)
detector.detect_objects(image).each do |region|
  puts region.inspect
  color = CvColor::Blue
  image.rectangle! region.top_left, region.bottom_right, :color => color
end

#image.save_image(output_file)
window = GUI::Window.new('Face detection')
window.show(image)
GUI::wait_key