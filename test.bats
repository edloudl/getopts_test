#!/usr/bin/env bats


@test "passing name Alex with -n" {
	run bash hello.sh -n Alex
	[[ $status -eq 0 ]]
	[[ $output == "Hello Alex" ]]
}

@test  "passing name Alex with --name" {
	run bash hello.sh --name Alex
	[[ $status -eq 0 ]]
	[[ $output == "Hello Alex" ]]
}

@test "passing -v" {
	run bash hello.sh -v
	[[ $status -eq 1 ]]
	[[ $output == "current version of the script is: v0.0.1" ]]
}


@test "passing --version" {
	run bash hello.sh --version
	[[ $status -eq 1 ]]
	[[ $output == "current version of the script is: v0.0.1" ]]
}


@test "passing -v and --version" {
	run bash hello.sh -v --version
	[[ $status -eq 0 ]]
	[[ $output == "current version of the script is: v0.0.1" ]]
}

@test "passing -n and --name" {
	run bash hello.sh -n Alex --name Alex	
	[[ $status -eq 0 ]]

}

