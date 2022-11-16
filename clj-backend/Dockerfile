FROM clojure:temurin-19-tools-deps

WORKDIR /app
COPY . ./

RUN clojure -P
RUN clojure -A:build -P
RUN clojure -T:build uber
RUN find ./target -type f -name "*.jar" > ./ENV_JAR

CMD java -jar $(cat ./ENV_JAR)