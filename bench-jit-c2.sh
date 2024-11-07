set -e

function print() {
    printf "\033[1;34m$1\033[0m\n"
}

print "Starting the app on the JVM..."

java -XX:-UseJVMCICompiler -Xmx512m -jar ./target/demo-0.0.1-SNAPSHOT.jar &
export PID=$!
psrecord $PID --plot "$(date +%s)-jit-c2.png" --max-cpu 2500 --max-memory 800 --include-children &

sleep 5
print "Done waiting for the app to come up..."

print "Starting the benchmark"

oha -n=1000000 http://localhost:8080/translations

print "Done!"
kill $PID
sleep 1
