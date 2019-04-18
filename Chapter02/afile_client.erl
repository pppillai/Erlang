-module(afile_client).

-export([get_file/2, list_directory/1]).

% list all the files in dir
list_directory(File_Server) ->
    % send request to file server
    % pid of server ! {pid of client, command}
    File_Server ! {self(), list_dir},
    % receive is called when message arrives.
    % pattern match what is being returned by server.
    receive {Server, FileList} -> FileList end.

get_file(File_Server, File) ->
    File_Server ! {self(), {get_file, File}},
    receive {Server, Content} -> Content end.
