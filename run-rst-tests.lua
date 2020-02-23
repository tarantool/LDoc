
local lfs = require('lfs')
local codes = {reset = "\27[0m", red = "\27[31m", green = "\27[32m"}

local test_dirs = {
   'tests/rst-tests/single',
   -- Uncomment when @see tag will be implemented
   -- 'tests/rst-tests/complex',
   'tests/rst-tests/submodule',
   'tests/rst-tests/usage',
   'tests/rst-tests/annotation'
}

local test_status = {}

local run = function (dir)
   print("TESTING "..dir)
   local pwd = lfs.currentdir()
   local cmd = 'cd '..dir..' &&  lua '..pwd..'/ldoc.lua --ext=rst --testing .  && diff -r doc cdocs'
   print(cmd) 
   return os.execute(cmd)
end

local after_each = function (d, rc)
   if rc ~= 0 then
      test_status[d] = "FAIL"
      print(codes.red.."FAIL"..codes.reset)
   else
      test_status[d] = "PASS"
      print(codes.green.."PASS"..codes.reset)
   end
   print()
end

local after_all = function()
   local passed_count = 0
   for d, status in pairs(test_status) do
      if status == "PASS" then
         passed_count = passed_count + 1
         print(d.."...."..codes.green.."PASS"..codes.reset)
      else
         print(d.."...."..codes.red.."FAIL"..codes.reset)
      end
   end
   print("========================================================")
   print("Ran "..#test_dirs.." tests, "..codes.green..passed_count.." success"..codes.reset..", "..codes.red..#test_dirs-passed_count.." failed"..codes.reset)

   if passed_count ~= #test_dirs then
      return 1
   else
      return 0
   end

end

for _,d in ipairs(test_dirs) do
   local rc = run(d)
   after_each(d ,rc)
end


local rc = after_all()

os.exit(rc)
