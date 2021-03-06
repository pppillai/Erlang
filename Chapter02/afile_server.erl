-module(afile_server).

-export([loop/1, start/1]).

start(Dir) -> spawn(afile_server, loop, [Dir]).

loop ( Dir ) -> receive 
    
    {Client , list_dir} ->
         Client ! {self(), file:list_dir (Dir)},
         NewDir = Dir;
    
    {Client , { get_file , File } } -> 
        Full = filename:join (Dir, File), 
        Client ! {self() , file:read_file (Full)},
        NewDir = Dir; 
    
    { Client , { create_new_file , File } } -> 
        Full = filename : join (Dir , File) , 
        File_handle = file:open(Full, [exclusive]),
        Client ! {self(), File_handle},
        NewDir = Dir;
    
    {Client, {change_directory, DirectoryPath}} ->
        NewDir = DirectoryPath
        Client ! {self(), {ok, "Done"}}
end, 
loop (NewDir).

