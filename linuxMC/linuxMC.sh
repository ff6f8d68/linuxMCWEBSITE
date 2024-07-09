#!/bin/bash

# Function to select a .jar file using zenity
select_jar_file() {
    jar_file=$(zenity --file-selection --title="Select your Minecraft JAR file" --file-filter="*.jar")
    if [ $? -ne 0 ]; then
        zenity --error --text="No JAR file selected or dialog canceled."
        exit 1
    fi
}
cp $jar_file ./library/jars/minecraft
# Function to enter nickname using zenity
enter_nickname() {
    nickname=$(zenity --entry --title="Enter Your Nickname" --text="Enter your nickname:")
    if [ $? -ne 0 ] || [ -z "$nickname" ]; then
        zenity --error --text="No nickname entered or dialog canceled."
        exit 1
    fi
}
jarname=$(basename "$jar_file")
bash ./library/launch.sh $jarname $nickname
# Function to run the Minecraft jar with the provided nickname
run_minecraft() {
    zenity --info --text="Running your Minecraft JAR as $nickname"
}

# Main script
select_jar_file
enter_nickname
run_minecraft
