set -e

function print() {
    printf "\033[1;35m$1\033[0m\n"
}

print "Starting the native app..."

./target/demo -Xmx512m &
export PID=$!
psrecord $PID --plot "$(date +%s)-native.png" --max-cpu 3000 --max-memory 100 --include-children &

sleep 5
print "Done waiting for the app to come up..."

print "Starting the first iteration 1️⃣"
hey -n=100000 http://localhost:8080/translations

print "Starting the second iteration 2️⃣"
hey -n=100000 http://localhost:8080/translations

print "Done!"
kill $PID
sleep 1
