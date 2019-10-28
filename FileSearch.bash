
#!/bin/bash
echo "Enter the name of the file you wish to search for"
read filename
#search for exact file in al directories
file="$(find . -name $filename)"
#Gives full path of file
path=$(realpath $file)
#Opens file
content=$(more $path)
#stores the word to search as a variable
read -p "Word to search: " search_word
found=false
#searches for word in content
for word in $content
do
        if [[ "$word" == "$search_word" ]]
        then
                found=true
                #returns true
        fi
done
#if true was returned
if [[ "$found" == "true" ]]
then
        echo "$search word exists in chosen file"

else
        echo "$search word doesn't exists in the chose file"
fi

echo "Would you like to see the contents of the file (y/n)?"
read choice 
#Allow user to see full content 
if [ $choice == "y" ]
then
echo "Here is the content:" 
echo $content

fi
