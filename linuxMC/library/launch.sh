#!/bin/bash

# Directory containing Minecraft and LWJGL files
MINECRAFT_DIR=./jars/minecraft/$1

username=$2

# Minecraft client JAR
MINECRAFT_JAR="$MINECRAFT_DIR/client.jar" # Change this to the name of your Minecraft client JAR

# LWJGL JAR
LWJGL_JAR=./jar/lwjgl/lwjgl.jar # Change this to the name of your LWJGL JAR

# Directory containing LWJGL native libraries
NATIVES_DIR="$MINECRAFT_DIR/natives"

# Main class of Minecraft (usually net.minecraft.client.main.Main)
MAIN_CLASS="net.minecraft.client.main.Main"





# Minecraft arguments (if any)
MINECRAFT_ARGS="--username $username --gameDir $MINECRAFT_DIR" # You can add more arguments if needed

# Run Minecraft
java -Xmx2G -Xms1G \
  -Djava.library.path=$NATIVES_DIR \
  -cp "$MINECRAFT_JAR:$LWJGL_JAR" \
  $MAIN_CLASS $MINECRAFT_ARGS
