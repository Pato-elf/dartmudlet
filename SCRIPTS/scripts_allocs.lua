local Allocs			= {}
local sourceName		= "allocs"



-- build or update the table during setup
-----------------------------------------------------------
local function checkAllocsTable(args)

	dba.execute([[CREATE TABLE IF NOT EXISTS allocs (
		id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
		allocIsActive BOOLEAN DEFAULT false,
		allocName VARCHAR(64) DEFAULT "default",
		allocOrderNumber INTEGER DEFAULT 0,
		allocTarget VARCHAR(16) DEFAULT "",
		bodypart1 VARCHAR(64) DEFAULT "left hand",
		bonus1 INTEGER DEFAULT 75,
		daring1 INTEGER DEFAULT 75,
		speed1 INTEGER DEFAULT 75,
		aiming1 INTEGER DEFAULT 75,
		parry1 INTEGER DEFAULT 0,
		control1 INTEGER DEFAULT 0,
		null1 INTEGER DEFAULT 300,
		bodypart2 VARCHAR(64) DEFAULT "right hand",
		bonus2 INTEGER DEFAULT 0,
		daring2 INTEGER DEFAULT 0,
		speed2 INTEGER DEFAULT 0,
		aiming2 INTEGER DEFAULT 0,
		parry2 INTEGER DEFAULT 150,
		control2 INTEGER DEFAULT 150,
		null2 INTEGER DEFAULT 300,
		bodypart3 VARCHAR(64) DEFAULT "",
		bonus3 INTEGER DEFAULT 0,
		daring3 INTEGER DEFAULT 0,
		speed3 INTEGER DEFAULT 0,
		aiming3 INTEGER DEFAULT 0,
		parry3 INTEGER DEFAULT 0,
		control3 INTEGER DEFAULT 0,
		null3 INTEGER DEFAULT 300,
		bodypart4 VARCHAR(64) DEFAULT "",
		bonus4 INTEGER DEFAULT 0,
		daring4 INTEGER DEFAULT 0,
		speed4 INTEGER DEFAULT 0,
		aiming4 INTEGER DEFAULT 0,
		parry4 INTEGER DEFAULT 0,
		control4 INTEGER DEFAULT 0,
		null4 INTEGER DEFAULT 300,
		bodypart5 VARCHAR(64) DEFAULT "",
		bonus5 INTEGER DEFAULT 0,
		daring5 INTEGER DEFAULT 0,
		speed5 INTEGER DEFAULT 0,
		aiming5 INTEGER DEFAULT 0,
		parry5 INTEGER DEFAULT 0,
		control5 INTEGER DEFAULT 0,
		null5 INTEGER DEFAULT 300,
		bodypart6 VARCHAR(64) DEFAULT "",
		bonus6 INTEGER DEFAULT 0,
		daring6 INTEGER DEFAULT 0,
		speed6 INTEGER DEFAULT 0,
		aiming6 INTEGER DEFAULT 0,
		parry6 INTEGER DEFAULT 0,
		control6 INTEGER DEFAULT 0,
		null6 INTEGER DEFAULT 300
	);]])


	local results = dba.query('SELECT id FROM allocs')
	if results.count() == 0 then
		for i = 1, 30 do
			dba.execute('INSERT INTO allocs DEFAULT VALUES')
		end
		dba.execute('UPDATE allocs SET allocOrderNumber=id')
	end

end



local function load()
	local result = {}
	
	result = dba.query('SELECT * FROM allocs ORDER BY allocOrderNumber')
	for i = 1, 30 do
		table.insert(Status.allocsTable, result[i])
	end

	for i, row in ipairs(Status.allocsTable) do
		print(row.id, row.allocName)
	end
end



local function save()
	
end



local function setup(args)
	checkAllocsTable()
end

local function unsetup(args)

end



local function resetup(args)
	unsetup(args)
	setup(args)
end



Allocs = {
	setup = setup,
	unsetup = unsetup,
	resetup = resetup,
	load = load,
	save = save
}

return Allocs
