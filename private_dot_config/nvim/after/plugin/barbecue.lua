local status, barbecue = pcall(require, "barbecue")
if not status then
	return
end
barbecue.setup()
