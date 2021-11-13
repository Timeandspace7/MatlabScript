%----------------------------------------------%
% @fn		: AlignSubSystemLines
% @brief	: 对齐与子系统相连的输入输出端口及其连线（该脚本并不进行连线操作）。
% @param	: NULL
% @return	: NULL
%----------------------------------------------%
% find_system(gcs)
% 找到所有子系统句柄
subSysHan = find_system(gcs, 'FindAll','on', 'SearchDepth','1', 'BlockType','SubSystem');
% 获得所有子系统的名字
subSysName = get(subSysHan,'Name');
% 获取子系统路径
subSysPath = [bdroot,'/',subSysName];
% 找出外部输入端口的句柄
inParent = find_system(bdroot,'FindAll','on', 'SearchDepth','1', 'BlockType', 'Inport');
% 找出外部输出端口的句柄
outParent = find_system(bdroot,'FindAll','on', 'SearchDepth','1', 'BlockType', 'Outport');
% 找出子系统输入端口的句柄
inSubsys = find_system(subSysPath,'FindAll','on', 'SearchDepth','1', 'BlockType', 'Inport');
% 找出子系统输出端口的句柄
outSubsys = find_system(subSysPath,'FindAll','on', 'SearchDepth','1', 'BlockType', 'Outport');
% 获得子系统的端口连接信息
portConInfo = get_param(subSysPath,'PortConnectivity');
for ii = 1:1:length(portConInfo)
	% 获得子系统端口的位置 (x,y)
	portPos = portConInfo(ii).Position;
	if(~isempty(portConInfo(ii).SrcBlock)) % portConInfo(ii).SrcBlock 返回值是 block 的句柄
		% 根据端口的位置，重新放置 block
		set_param(portConInfo(ii).SrcBlock,'Position',[portPos(1)-200,portPos(2)-5,portPos(1)-180,portPos(2)+5]);
	end
	if(~isempty(portConInfo(ii).DstBlock)) % 判断 DstBlock 的值是否为空
		set_param(portConInfo(ii).DstBlock,'Position',[portPos(1)+180,portPos(2)-5,portPos(1)+200,portPos(2)+5]);
	end
end
