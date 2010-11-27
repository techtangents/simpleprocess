module System.SimpleProcess (
    exec,
    execWith,
    execFrom,
    execFromWith
) where

import System.Process
import System.Exit
import Data.Maybe

type Command = FilePath
type Args = [String]
type WorkingDir = FilePath

exec :: Command -> IO ExitCode
exec command =
    runAndWait command Nothing Nothing

execWith :: Command -> Args -> IO ExitCode
execWith command args =
    runAndWait command (Just args) Nothing

execFrom :: WorkingDir -> Command -> IO ExitCode
execFrom working command  =
    runAndWait command Nothing (Just working)

execFromWith :: WorkingDir -> Command -> Args -> IO ExitCode
execFromWith working command args =
    runAndWait command (Just args) (Just working)

runAndWait :: Command -> Maybe Args -> Maybe WorkingDir -> IO ExitCode
runAndWait command args working =
    	runProcess command (fromMaybe [] args) working Nothing Nothing Nothing Nothing
    >>= waitForProcess

