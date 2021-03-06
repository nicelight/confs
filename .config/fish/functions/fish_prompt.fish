function fish_prompt
    if not set -q -g __fish_robbyrussell_functions_defined
        set -g __fish_robbyrussell_functions_defined

        function _git_branch_name
            echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
        end

        function _is_git_dirty
            echo (git status -s --ignore-submodules=dirty ^/dev/null)
        end

        function _is_git_repo
            git status -s >/dev/null ^/dev/null
        end

        function _repo_branch_name
            eval "_$argv[1]_branch_name"
        end

        function _is_repo_dirty
            eval "_is_$argv[1]_dirty"
        end

        function _repo_type
            if _is_git_repo
                echo 'git'
            end
        end
    end

    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname)
    end

    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l blue (set_color -o blue)
    set -l normal (set_color normal)

    set -l heart_and_hostname "$cyan$__fish_prompt_hostname$red ❤"
    
    if [ $USER = 'root' ]
        set heart_and_hostname "$cyan$__fish_prompt_hostname$red# "
    end

    set -l cwd (basename (prompt_pwd))

    set -l repo_type (_repo_type)
    if [ $repo_type ]
        set -l repo_branch (_repo_branch_name $repo_type)
        set repo_info " $repo_type:($repo_branch)"

        if [ (_is_repo_dirty $repo_type) ]
            set -l dirty "✗"
            set repo_info "$repo_info $dirty"
        end
    end

    echo -n -s $cwd $repo_info $normal ' >>> '
end
