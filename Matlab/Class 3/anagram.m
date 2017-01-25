function isAnagram = anagram(what,that)
    what = sort(strrep(lower(what),' ',''));
    that = sort(strrep(lower(that),' ',''));
    if(numel(what) ~= numel(that))
        isAnagram = false;
        return;
    end
    isAnagram = (what == that);
    isAnagram = numel(isAnagram) == numel(isAnagram(isAnagram == 1));
end