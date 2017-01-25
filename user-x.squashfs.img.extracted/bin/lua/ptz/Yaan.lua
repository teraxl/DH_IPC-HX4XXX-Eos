-- ��YAAN������Ѿ���ͨ�����й�Ȧ�޷�����
local Protocol = {};

-- ��ʾ��ֵ������16��10����(��Сֵ�����ֵ)
Protocol.Attr = 
{
	-- Э�����ʾ����,���ܳ���16�ַ���Ŀǰ�ݲ�֧������
	Name = "YAAN",	
		
	-- ָ������̨Э�黹�Ǿ���Э�飬ʹ��"PTZ", "MATRIX"��ʾ
	Type = "PTZ",
	
	-- ��msΪ��λ
	Internal = 200,
				
	-- û�ж�Ӧ�ĵ�ַ��Χ���붼���0xff
	-- ��̨��ַ��Χ
	CamAddrRange 		= {0x01, 0xFF}, 
	-- ���ӵ�ַ��Χ
	MonAddrRange		= {0x00, 0xFF},	
	-- Ԥ�õ㷶Χ
	PresetRange 		= {0x00, 0xff},
	-- �Զ�Ѳ����·��Χ
	TourRange			= {0x01, 0x01},
	-- �켣��·��Χ
	PatternRange		= {0x01, 0xff},
	-- ��ֱ�ٶȷ�Χ
	TileSpeedRange 		= {0x01, 0xfF},
	-- ˮƽ�ٶȷ�Χ
	PanSpeedRange 		= {0x01, 0xfF},
	-- �Զ�ɨ�跶Χ
	ScanRange 			= {0x01, 0xff},
	
	-- ������Χ
	AuxRange 			= {0x01, 0x08},
}

Protocol.CommandAttr =
{
	-- Э������Ҫ���ĵ�λ�ã���LUA�±��ʾ�����±�ӣ���ʼ,��10���Ʊ�ʾ
	AddrPos 			= 2, 
	PresetPos 		= 4, 
	TileSpeedPos 	= 11,
	PanSpeedPos 	= 10,
	AuxPos 				= 6,
}

Protocol.Command = 
{
	-- д����Э��ʱֻ����16���ƻ��ַ���ʾ,û�еĻ���ע�͵�
	Start= 
	{
		--д��������, ���ϣ����£����ϣ�����
		TileUp 		= "0x02, 0x01, 0x01, 0x04, 0x00, 0x00, 0x02, 0x01, 0x0e, 0x00, 0x00, 0x00",
		TileDown 	= "0x02, 0x01, 0x01, 0x08, 0x00, 0x00, 0x02, 0x01, 0x0e, 0x00, 0x00, 0x00",
		PanLeft 	= "0x02, 0x01, 0x01, 0x02, 0x00, 0x00, 0x02, 0x01, 0x0e, 0x00, 0x00, 0x00", 
		PanRight 	= "0x02, 0x01, 0x01, 0x01, 0x00, 0x00, 0x02, 0x01, 0x0e, 0x00, 0x00, 0x00",
		LeftUp 		= "0x02, 0x01, 0x01, 0x06, 0x00, 0x00, 0x02, 0x01, 0x0e, 0x00, 0x00, 0x00",
		LeftDown 	= "0x02, 0x01, 0x01, 0x0a, 0x00, 0x00, 0x02, 0x01, 0x0e, 0x00, 0x00, 0x00",
		RightUp		= "0x02, 0x01, 0x01, 0x05, 0x00, 0x00, 0x02, 0x01, 0x0e, 0x00, 0x00, 0x00",
		RightDown = "0x02, 0x01, 0x01, 0x09, 0x00, 0x00, 0x02, 0x01, 0x0e, 0x00, 0x00, 0x00",

		ZoomWide 	= "0x02, 0x01, 0x01, 0x10, 0x00, 0x00,",
		ZoomTele 	= "0x02, 0x01, 0x01, 0x20, 0x00, 0x00,",
		FocusNear	= "0x02, 0x01, 0x01, 0x40, 0x00, 0x00,",
		FocusFar 	= "0x02, 0x01, 0x01, 0x80, 0x00, 0x00,",
		IrisSmall = "0x02, 0x01, 0x01, 0x00, 0x02, 0x00,",
		IrisLarge = "0x02, 0x01, 0x01, 0x00, 0x01, 0x00,",
			
		-- Ԥ�õ���������ã������ת��)
		SetPreset 	= "0x02, 0x01, 0x05, 0x01, 0x00,",
		GoToPreset 	= "0x02, 0x01, 0x02, 0x01, 0x00,",			
			
		-- �Զ�ɨ�裬��Ԥ�����õı߽��м�ת��
		SetLeftLimit 	= "0x02, 0x01, 0x0f, 0x02, 0x01, 0x00",
		SetRightLimit	= "0x02, 0x01, 0x0f, 0x02, 0x02, 0x00", 
		AutoScanOn 		= "0x02, 0x01, 0x0f, 0x03, 0x00, 0x00",
			
		-- �Զ�Ѳ����һ��ָ��Ԥ�õ�֮��Ѳ��
		AddTour 		= "0x02, 0x01, 0x06, 0x01, 0x00,",
		DeleteTour 	= "0x02, 0x01, 0x08, 0x00, 0x00,",
		StartTour 	= "0x02, 0x01, 0x03, 0x00, 0x00,",
	},
	Stop = 
	{
		TileUp 		= "0x02, 0x00, 0x01, 0x00, 0x00, 0x00",
		TileDown 	= "0x02, 0x00, 0x01, 0x00, 0x00, 0x00",
		PanLeft 	= "0x02, 0x00, 0x01, 0x00, 0x00, 0x00",
		PanRight 	= "0x02, 0x00, 0x01, 0x00, 0x00, 0x00",
		LeftUp 		= "0x02, 0x00, 0x01, 0x00, 0x00, 0x00",
		LeftDown 	= "0x02, 0x00, 0x01, 0x00, 0x00, 0x00",
		RightUp		= "0x02, 0x00, 0x01, 0x00, 0x00, 0x00",
		RightDown = "0x02, 0x00, 0x01, 0x00, 0x00, 0x00",
		
		ZoomWide 	= "0x02, 0x00, 0x01, 0x00, 0x00, 0x00",
		ZoomTele 	= "0x02, 0x00, 0x01, 0x00, 0x00, 0x00",
		FocusNear = "0x02, 0x00, 0x01, 0x00, 0x00, 0x00",
		FocusFar 	= "0x02, 0x00, 0x01, 0x00, 0x00, 0x00",
		IrisSmall = "0x02, 0x00, 0x01, 0x00, 0x00, 0x00",
		IrisLarge = "0x02, 0x00, 0x01, 0x00, 0x00, 0x00",
	},
}

Protocol.Checksum = function (s)
	if table.getn(s) == 5 then
		s[5] = math.mod((s[1] + s[2] + s[3] + s[4]), 256);
	elseif table.getn(s) == 6 then
		s[6] = math.mod((s[1] + s[2] + s[3] + s[4]+ s[5]), 256);
	elseif table.getn(s) == 12 then
		s[6] = math.mod((s[1] + s[2] + s[3] + s[4]+ s[5]), 256);
		s[8] = s[2];
		s[12] = math.mod((s[7] + s[8] + s[9] + s[10]+ s[11]), 256);
	end;
	return s;
end;

Protocol.SetTourProcess = function(s, tour, preset)
	s[4] = preset;
	return s;
end;

return Protocol;