-- 函数说明：插入排序
--
-- @param   {array} array 需要排序的数组
-- @param   {int}   s 排序的起始index
-- @param   {int}   e 排序的结束index
--
-- @return 空
local insert_sort = function(array, s, e)
    local start_ = 1
    local end_ = #array
    if(s and e) then start_, end_ = s, e end

    for i = start_, end_, 1 do
        local insert_data = array[i]
        local j = i
        while (j > start_) do
            if(array[j - 1] > insert_data) then
                array[j] = array[j - 1]
            else
                break;
            end
            j = j - 1
        end

        if(j ~= i) then
            array[j] = insert_data
        end
    end
end

return insert_sort

