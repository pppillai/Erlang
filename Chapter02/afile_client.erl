-module(afile_client).

-export([get_file/2, list_directory/1, put_file/2, change_directory/2]).

% list all the files in dir
list_directory(File_Server) ->
    % send request to file server
    % pid of server ! {pid of client, command}
    File_Server ! {self(), list_dir},
    % receive is called when message arrives.
    % pattern match what is being returned by server.
    receive {Server, FileList} -> FileList end.

% list the contents of file
get_file(File_Server, File) ->
    File_Server ! {self(), {get_file, File}},
    receive {Server, Content} -> Content end.

% create a new file if does not exist otherwise throw error.
put_file(File_Server, File) ->
    File_Server ! {self(), {create_new_file, File}},
    receive 
        {Server, {ok, FileHandleProcess}} -> FileHandleProcess;
        {Server, {error, ErrorType}} -> "File Already Exists"
    end.

change_directory(File_Server, DirectoryPath) ->

    File_Server ! {self(), {change_directory, DirectoryPath}} ->
        receive
            {Server, IsDone} -> IsDone
        end.