%% The contents of this file are subject to the Mozilla Public License
%% Version 1.1 (the "License"); you may not use this file except in
%% compliance with the License. You may obtain a copy of the License at
%% http://www.mozilla.org/MPL/
%%
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
%% License for the specific language governing rights and limitations
%% under the License.
%%
%% The Original Code is RabbitMQ.
%%
%% The Initial Developer of the Original Code is GoPivotal, Inc.
%% Copyright (c) 2007-2017 Pivotal Software, Inc.  All rights reserved.
%%

-module(rabbit_peer_discovery_classic_config).
-behaviour(rabbit_peer_discovery_backend).

-include("rabbit.hrl").

-export([list_nodes/0, register/0, unregister/0]).

%%
%% API
%%

-spec list_nodes() -> {ok, Nodes :: list()} | {error, Reason :: string()}.

list_nodes() ->
    case application:get_env(rabbit, cluster_nodes) of
        {_Nodes, _NodeType} = Pair -> Pair;
        Nodes when is_list(Nodes)  -> {Nodes, disc};
        undefined                  -> {[], disc}
    end.

-spec register() -> ok.

register() ->
    ok.

-spec unregister() -> ok.

unregister() ->
    ok.
