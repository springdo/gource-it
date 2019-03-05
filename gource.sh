
set +e
# set -x

echo "Removing previous gource bits\n\n"
rm -rf *.txt *txt-r combined-gource.mp4 combined-gource.ppm

echo "Running gource across current dir of repos\n\n"
for p in $(ls -d */); do
  p=${p%%/}
  echo "gource --output-custom-log ${p}.txt ${p}" | sh
  sed -i '' -e "s#\|\/#\|\/${p}\/#g"  ${p}.txt
done

echo "Creating combined gource textfile\n\n"
cat *.txt | sort > combined-gource.txt

echo "Creating combined gource vid & compressing it\n\n"
gource combined-gource.txt -1280x720  --seconds-per-day 1 -o combined-gource.ppm
ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i combined-gource.ppm -vcodec libx264 -preset ultrafast -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 combined-gource.mp4

echo "Tidying up temp files\n\n"
rm -rf *.txt combined-gource.ppm
