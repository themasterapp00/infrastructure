#bash
cd ../..
git pull
mvn clean package
cd docker/dev
cp ../../target/backend-0.0.1-SNAPSHOT.jar ./backend/files/backend-0.0.1-SNAPSHOT.jar
docker compose up -d --build
