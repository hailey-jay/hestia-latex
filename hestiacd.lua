function ayudame(text)
   texio.write("AYUDAME\n",text,"\n")
end

function diagonal(n)
   local d = 0
   n=n-1
   while n>d do
      n=n-d-1
      d=d+1
   end
   return {d-n+1,n+1}
end

function len(T)
   if type (T) == "number" then
      return #tostring(T)
   elseif type (T) == "string" then
      return #T
   elseif not T then
      return 0
   end
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

loc={}
tble={}
unset={}
data={}
arrowsfrom={}

function clear()
   loc={}
   tble={}
   t_row=nil
   l_col=nil
   b_row=nil
   r_col=nil
   unset={}
   data={}
   arrowsfrom={}
end

function declare_set(idx,row,col,info)
   loc[idx]={["row"]=row,["col"]=col}
   if tble[row] then
      tble[row][col]=idx
   else
      tble[row]={idx}
   end
   
   data[idx]=info
   t_row=t_row or row
   b_row=b_row or row
   r_col=r_col or col
   l_col=l_col or col
   t_row=math.min(t_row,row)
   b_row=math.max(b_row,row)
   r_col=math.max(r_col,col)
   l_col=math.min(l_col,col)
   --nsew
end

function declare_unset(idx,info)
   data[idx]=info
   unset[idx]=1
end

function set_unset(idx,row,col,info)
   unset[idx]=nil
   declare_set(idx,row,col,info)
end

function truepos(idx) 
   return {["row"]=loc[idx]["row"]-t_row+1,
      ["col"]=loc[idx]["col"]-l_col+1}
end

function declare_default(idx,info)
   x=1
   while x<(len(tble)+2) do
      pos=diagonal(x)
      if not tble[pos[1]] then
	 declare_set(idx,pos[1],pos[2],info)
	 break
      elseif not tble[pos[1]][pos[2]] then
	 declare_set(idx,pos[1],pos[2],info)
	 break
      else
	 x=x+1
      end
   end
end

function set_data(idx,info)
   data[idx]=info
end

function safe_data(idx)
   return data[idx] or idx
end


function adj_index()
   rows=b_row-t_row+1
   cols=r_col-l_col+1
   local out={}
   local curr_row={}
   for i=1, rows do
      curr_row={}
      for j=1, cols do
	 table.insert(curr_row," ")
	 --print("at ",i,j,truedata(i,j))
      end
      table.insert(out,curr_row)
   end
   for idx,pos in pairs(loc) do
      out[truepos(idx)["row"]][truepos(idx)["col"]]="{"..safe_data(idx).."}"
   end
   return out
end


function cat(a,b)
   if not a then
      return b
   elseif not b then
      return a
   else
      return a..b
   end
end

function latex_tble()
   data_tble=adj_index()
   padding = 1
   sep = "&"
   lineend = "\\\\\n"
   out=""
   padto={}

   for i=1,#data_tble[1] do
      padto[i]=0
      for j=1,#data_tble do
	 padto[i]=math.max(padto[i],#tostring(data_tble[j][i]))
      end
      padto[i]=padto[i]+padding
      --print("line",i)
   end

   for key,val in pairs(padto) do
      padto[key]=val+padding
   end

   for key_r,row in pairs(data_tble) do
      for key_c,entry in pairs(row) do
	-- print(entry,sep,padto[key_c])
	 out=out..entry..string.rep(" ",padto[key_c]-len(entry))..sep
      end
      out=out:sub(1,-(1+#sep))..lineend
   end
   out= out:sub(1,-(2+#lineend)).."\n"
   for key,arrows in pairs(arrowsfrom) do
      for k,arrow in pairs(arrows) do
	 if arrow["opt"] and arrow["opt"]~="" then
	    topt=arrow["opt"]..","
	 else
	    topt=""
	 end	 out=out.."\\arrow["..cat(topt,"from="..truepos(key)["row"].."-"..truepos(key)["col"]..",to="..truepos(arrow["dest"])["row"].."-"..truepos(arrow["dest"])["col"]).."]\n"
      end
   end
   return(out)
end

--arrows
--Data
function arrow(src,dest,opt)
   if arrowsfrom[src] then
      table.insert(arrowsfrom[src],{["dest"]=dest,["opt"]=opt})
   else
      arrowsfrom[src]={
		      {["dest"]=dest,["opt"]=opt}}
   end
end





--Data
heads={["%-"]="no head",["/"]="harpoon",["\\"]="harpoon'",[">>"]="two heads"}
tails={[">"]="tail",["|"]="maps to",["c"]="hook",["l"]="hook'",["<"]="tail reversed"}
bodies={["%(%)"]="no body",["%-%."]="dashed",["%.%-"]="dashed",["%.%."]="dotted"}

function collect(n,t)
   local out=""
   for i=n,#t do
      out=cat(out,t[i].." ")
   end
   return out:sub(1,-2)
end

function recognize_arrow(text)
   local options =""

   for key,value in pairs(heads) do
      if text:match(key.."$") then
	 options=options..value..","
	 break
      end
   end

   for key,value in pairs (bodies) do
      if string.match(text,key) then
	 options=options..value..","
	 break
      end
   end

   for key,value in pairs (tails) do
      if text:match("^"..key) then
	 options=options..value..","
	 break
      end
   end

   if options ~= "" then
      options=options:sub(1,-2)
   end
   
   return options
end


function smart_map(src,dest,row_disp,col_disp,opt)
   texio.write(src..","..dest..","..cat(commacat(row_disp,col_disp),",")..opt.."\n")
   arrow(src,dest,opt)
   if not loc[src] and not data[src] then
      declare_unset(src)
   end
   if not loc[dest] and not data[dest] then
      declare_unset(dest)
   end

   if loc[src] and not loc[dest] then
      declare_set(dest,loc[src]["row"]+row_disp,loc[src]["col"]+col_disp)
   elseif loc[dest] and not loc[src] then
      declare_set(src,loc[dest]["row"]-row_disp,loc[dest]["col"]-col_disp)
   elseif not loc[src] and not loc[dest] then
      declare_default(src)
      if not row_disp then
	 declare_default(dest)
      else
	 declare_set(dest,loc[src]["row"]+row_disp,loc[src]["col"]+col_disp)
	 end
      end
end
function tokenize(str)
   local token=nil
   local t={}
   local row ={}
   local cgrp=nil
   local insert=true
   local i = 1
   while i < #str do
      local c = str:sub(i,i)
      if (c == " " or c=="\n") and not cgrp then
	 table.insert(row,token)
	 token = nil
      elseif c=="\\" then
	 token=cat(token,c)
	 i=i+1
	 token=cat(token,str:sub(i,i))
      elseif c=="@" then
	 i=i+1
	 token=cat(token,str:sub(i,i))
      elseif c=="{" then
	 cgrp=true
      elseif c=="}" then
	 cgrp=false
	 table.insert(row,token)
	 token=nil
      elseif c==";" then
	 table.insert(row,token)
	 table.insert(t,row)
	 token=nil
	 row={}
      elseif c=="~" then
	 token=cat(token,"\\")
      else
	 token=cat(token,c)
      end
      i=i+1
   end
   table.insert(row,token)
   table.insert(t,row)
   return t
end

function t_parse(t)
   if #t==0 then return end
   local c = 1
   local command
   local obj1
   local obj2
   local arrowstr
   local opt
   local name
   local pos
   local col_disp
   local row_disp
   if t[c]=="data" then
      command="data"
      obj1=t[2]
      opt=t[3]
      data[obj1]=opt
   else
      command="map"
      if t[c]=="map" then
	 c=c+1
      end
      obj1=t[c]
      arrowstr=recognize_arrow(t[c+1])
      obj2=t[c+2]
      c=c+3

      if t[c] and t[c]:match("^[rlud]+$") then
	 col_disp=0
	 row_disp=0
	 for i=1,#t[c] do
	    ch=t[c]:sub(i,i)  
	    if ch == "r" then
	       col_disp=col_disp+1
	    elseif ch=="l" then
	       col_disp=col_disp-1
	    elseif ch=="d" then
	       row_disp=row_disp+1
	    else
	       row_disp=row_disp-1
	    end
	 end
	 pos=commacat(col_disp,row_disp)
	 c=c+1
      end

      if t[c]=="by" then
	 name="\"{"..t[c+1].."}\""
	 c=c+2
      end
      

      opt=commacat(name,collect(c,t))
      opt=commacat(opt,arrowstr)
      --aha!
      smart_map(obj1,obj2,row_disp,col_disp,opt)
   end
   --tex.sprint(" ","------------",#t,"+",command,"+",obj1,"+",obj2,"+",pos,"+",opt,"-----------------")

end

--[[
function t_parse(t)
   
   return
   texio.write("Parsing...\n")
   if t[1] == "map" then
      texio.write("Mapping...\n")
      command="map"
      start=2
   elseif t[1] == "data" then
      command="data"
   data[t[2]]--=t[3]
--[[
      texio.write("Setting data...\n")
      texio.write("data".." "..t[2].." "..t[3].."\n")
      return
   else
      texio.write("Mapping...\n")
      command="map"
      start=1
   end

   if command=="map" then
      local obj1=t[start]
      if not obj1 then
	 return
      end
      
      local obj2=t[start+2]
      local arrowstr=t[start+1]
      local col_disp=nil
      local row_disp=nil
      local arrowname=nil
      local opt=""
      if t[start+3] and t[start+3]:match("^[rlud]+$") then
	 col_disp=0
	 row_disp=0
	 for i=1,#t[start+3] do
	    ch=t[start+3]:sub(i,i)  
	    if ch == "r" then
	       col_disp=col_disp+1
	    elseif ch=="l" then
	       col_disp=col_disp-1
	    elseif ch=="d" then
	       row_disp=row_disp+1
	    else
	       row_disp=row_disp-1
	    end
	 end
	 start=start+1
      end
      texio.write(obj1..","..obj2..","..cat(t[start+3],"\n"))
      if t[start+3]=="by" then
	 start=start+2
	 arrowname="\"{"..t[start+2].."}\""
      end
      
      opt=commacat(collect(start+3,t),recognize_arrow(arrowstr))
      opt=commacat(opt,arrowname)
      --[[
      if recognize_arrow(arrowstr) == "" then
	 opt=collect(start+3,t)
      elseif collect(start+3,t) == "" then
	 opt=recognize_arrow(arrowstr)
      else
	 opt=regonize_arrow(arrowstr)..","..collect(start+3,t)
      end
      
      print("map",obj1,obj2,opt,row_disp,col_disp)
      smart_map(obj1,obj2,row_disp,col_disp,opt)
   end
   end
--]]

function commacat(a,b)
   if a == "" or not a then
      return b
   elseif b == "" or not b then
      return a
   else
      return a..","..b
   end
end

function safeprint(t)
   if type (t)=="table" then
      for k,v in pairs(t) do
	 tex.write(k..",")
	 safeprint(v)
      end
   else
      tex.write(commacat(k,v))
   end
   tex.write("\n---\n\n")
end



function parse(text)
   --tex.write(text)
   --t=tokenize(text)
   --safeprint(t)
   for key,val in pairs(tokenize(text)) do
      t_parse(val)
      --print(type(val))
      tex.sprint("~\\newline")
end
      --
end

function testparse(text)
   clear()
   parse(text)
   texio.write("\\[\\begin{tikzcd}\n"..latex_tble().."\\end{tikzcd}\\]")
   tex.print("\\[\\begin{tikzcd}\n"..latex_tble().."\\end{tikzcd}\\]")
end

