# To create an empty file with some size
dd if=/dev/zero of=out.data bs=1M count=10

# Repeat a command until it is successful
while true
do
  ping -c 1 www.google.com > /dev/null 2>&1 && break
done

# convert a file to upper ot lower case
cat file.txt |tr a-z A-Z >out.txt

#Just use {} combined with the –i parameter, like below, to replace arguments in the place where the output of the first command should go:

ls /etc/*.conf | xargs -i cp {} /home/likegeeks/Desktop/out
