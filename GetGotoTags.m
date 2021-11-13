%----------------------------------------------%
% @fn		: GetGotoTags
% @brief	: 获得当前模型(gcs)下的所有 Goto 模块的 GotoTag.
% @param	: NULL
% @return	: NULL
%----------------------------------------------%
% 获得当前模型(gcs)下的所有 Goto 模块路径，返回类型为 cell .
% gotoCells = find_system(gcs, 'SearchDepth', 1, 'FindAll','on', 'BlockType', 'Goto');
% 获得当前模型(gcs)下的所有 Goto 模块句柄，返回类型为 vector .
gotoHandles = find_system(gcs, 'SearchDepth', 1, 'FindAll','on', 'BlockType', 'Goto');
for i=1:length(gotoHandles)
	get(gotoHandles(i), 'GotoTag')
end


%----------------------------------------------%
% @fn		: GetOneGotoTag
% @brief	: 获得当前模型(gcs)下的被选中 Goto 模块的 GotoTag.
% @param	: NULL
% @return	: NULL
%----------------------------------------------%
% handle = get_param(gcb,'Handle');
% get(handle, 'GotoTag')
