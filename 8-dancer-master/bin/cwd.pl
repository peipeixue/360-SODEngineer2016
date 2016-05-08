#!/usr/bin/env perl
use Dancer;
use myapp;
use Template;
use warnings;
use Text::Table;
#use strict;
get '/download/:path' => sub{
	my($file) = ''.param('path');
	print $file;
};


#get '/hello/:name'=>sub{
#	template 'hello' =>{number=>42}
#};


#get '/hello/' =>sub{
#	my $path="/home/";
#	my @dir=glob($path);
#	foreach (@dir)
#	{
#		print;
#		print "\n";
#	}
#};


get '/hello/' =>sub{
	my $search_folder = '/home/cwd/learn/perl/';
	sub data_for_path 
	{
        my $path = shift;
        if (-f $path or -l $path) 
		{
                return undef;
        }
        if (-d $path) 
		{
                my %directory;
                opendir PATH, $path or die "Cannot opendir $path: $!\n";
                my @names = readdir PATH;
                closedir PATH;
                for my $name (@names) 
				{
                        next if $name eq '.' or $name eq '..';
                        $directory{$name} = data_for_path("$path/$name");
                }
                return \%directory;
        }
        warn "$path is neither a file nor a directory\n";
        return undef;
	}
	#print Dumper(data_for_path('.'));
	sub dump_data_for_path 
	{
        my $path = shift;
        my $data = shift;
        if (not defined $data) 
		{
            print "$path\n";
            return;
        }
        my %directory = %$data;
        for (sort keys %directory) 
		{
                dump_data_for_path("$path/$_",$directory{$_});
        }
	}
	dump_data_for_path("$search_folder", data_for_path("$search_folder"));
};


get '/theonecwd/:filePath'=>sub{

	my $tb =Text::Table->new("filename","createtime");
	#my $search_folder = '/home/cwd/learn/perl';
	my ($search_folder) =''.param('filePath');
	$search_folder='/'.$search_folder;
	print $search_folder;
	#my %directory;

	sub data_for_path 
	{
		my $path = shift;
		if (-f $path or -l $path) 
		{
            return undef;
		}
		if (-d $path) 
		{
			my %directory;
            opendir PATH, $path or die "Cannot opendir $path: $!\n";
            my @names = readdir PATH;
            closedir PATH;
            for my $name (@names) 
			{
                    next if $name eq '.' or $name eq '..';
                    $directory{$name} = data_for_path("$path/$name");
            }
            return \%directory;
		}
		warn "$path is neither a file nor a directory\n";
		return undef;
	}
	#print Dumper(data_for_path('.'));
	sub dump_data_for_path 
	{
	
		my $path = shift;
		my $data = shift;
		my $tb = shift;
		if (not defined $data) 
		{

			my $file=$path;
			my $ctime;
			my $sec;
			my $min;
			my $hour;
			my $day;
			my $mon;
			my $year;
			my $result;
			$ctime=(stat($file))[10];
			($sec,$min,$hour,$day,$mon,$year)=localtime($ctime);
			$result=sprintf ("%04d%02d%02d%02d%02d%02d\n", $year + 1900, $mon + 1, $day, $hour, $min, $sec);
			#print "\n";
			$tb->add($path,$result);
			$tb->add(' ');
			return ;
		}
		my %directory = %$data;
		for (sort keys %directory) 
		{
            dump_data_for_path("$path/$_",$directory{$_},$tb);
		}
	}

	dump_data_for_path("$search_folder", data_for_path("$search_folder"),$tb);
	print  $tb;

};
dance;
