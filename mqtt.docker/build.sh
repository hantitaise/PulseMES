# 1️⃣ Build the image
docker build -t pulseMES_SPV .

# 2️⃣ Run a container
docker run -d \
  -p 1883:1883 \
  -p 8883:8883 \
  -p 80:80 \
  --name pulseMES_SPV 
