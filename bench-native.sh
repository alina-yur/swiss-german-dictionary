set -e

function print() {
    printf "\033[1;35m$1\033[0m\n"
}


print "Starting the native app..."
./target/demo-original -Xmx512m &
export PID=$!
psrecord $PID --plot "$(date +%s)-native.png" --max-cpu 2500 --max-memory 800 --include-children &

sleep 5
print "Done waiting for the app to come up..."

print "Starting the benchmark"
hey -n=500000 http://localhost:8080/translations

print "Done!"
kill $PID
sleep 1
