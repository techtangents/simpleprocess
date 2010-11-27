SimpleProcess
=============

A simple Haskell API for running external processes synchronously. Wraps System.Process methods.

Examples
--------

module Main where
import System.SimpleProcess

a = exec "ls"
b = execFrom "/var" "ls"
c = execWith "ls" ["-la"]
d = execFromWith "/var" "ls" ["-la"]

