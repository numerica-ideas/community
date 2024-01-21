package dev.ajim;

import com.github.ricksbrown.cowsay.Cowsay;

public class Main{

    public static void main(String[] args) {
        String[] cowArgs = new String[] { "Hello Mr Cow" };

        String cowString = Cowsay.say(cowArgs);

        System.out.printf(cowString);
    }

}

