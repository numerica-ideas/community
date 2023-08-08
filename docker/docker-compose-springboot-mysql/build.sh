# Compile the App and move the JAR executable file to the root folder under runnable.jar

rm -f *.jar
./mvnw clean install -DskipTests
cp target/*.jar runnable.jar

echo "App Compiled Successfully"
