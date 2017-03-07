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
 find . -type f -name “*.htm” -exec sh -c ‘f={};mv -f $f $(basename “$f” .htm).html’ \;

a="outside"
sh -c 'a="inside"; echo $a'
sh -c "a=\"inside\"; echo $a"


echo " test" > -f
rm -- -f
rm ./-f


* * * * * *
| | | | | | 
| | | | | +-- Year              (range: 1900-3000)
| | | | +---- Day of the Week   (range: 1-7, 1 standing for Monday)
| | | +------ Month of the Year (range: 1-12)
| | +-------- Day of the Month  (range: 1-31)
| +---------- Hour              (range: 0-23)
+------------ Minute            (range: 0-59)



# if outfile of a running process is accedentally deleted and to recover the output log file before log rotation happens ( sending HUP)

ls -la /proc/966/fd/10
lrwx------ 1 root root 64 Sep  5 08:56 /proc/966/fd/10 -> /var/lib/critical/process.out (deleted)

 dd if=/proc/966/fd/10 of=/tmp/recovered.out
 
 tail -f -n +0 /proc/966/fd/10 > /tmp/recovered.out


# if disk is full without any file having huge sizes, check with any open file descriptors from processes for any references to large files
lsof | grep deleted | awk '{print $2,$4,$8,$9}'


