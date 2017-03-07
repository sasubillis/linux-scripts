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


# handling large number of files in a single dir
find . -maxdepth 1 -name '[!.]*' -print0 | xargs -r0 mv --target='/some/other/directory'
getconf ARG_MAX


#I tried to delete all the files in the current folder with rm -f * and got myself with an 
# “argument list too long” type of error. I really want the files deleted.

find . -maxdepth 1 -type f -print0 | xargs -0 rm -f
#The -print0 passes out file names separated by the null terminator. 
#xargs -0 picks them up from the stream in this particular format. 
#This is required for files containing unusual characters such as space, tab, line terminators and so on.

find . -type f -name "*.htm" -exec mv -f {} {}l \;

# {} is replaced by find with the file name.

 find . -type f -name "*.html" -exec sh -c 'f="{}"; mv -f $f ${f%l}' \;

a="outside"
sh -c 'a="inside"; echo $a'
sh -c "a=\"inside\"; echo $a"


echo " test" > -f
rm -- -f
rm ./-f

