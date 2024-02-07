local ServerScriptService = game:GetService("ServerScriptService");
local Framework = require(ServerScriptService:WaitForChild("src"):WaitForChild("Framework"));

local SystemMessagingService = {}
SystemMessagingService.__index = SystemMessagingService;

type MessageData = {
	Prefix: string?,
	Message: string,
	Color: Color3?,
	Font: Font?,
	TextSize: number?
}

local require = Framework:GetModulesFromCache();

function SystemMessagingService:Init(): self 
	local self = setmetatable({}, SystemMessagingService);

	self.Network = require("Network");

	return self;
end;

function SystemMessagingService:SendServerMessage(MessageData: MessageData)
	if MessageData then
		self.Network:FireAllClients("SendSystemMessage", MessageData);
	end;
end;

return SystemMessagingService