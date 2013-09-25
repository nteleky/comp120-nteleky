# Web Engineering: Comp 120
# Lab 1: Ruby and CouchDB
# Nicholas Teleky
# September 24, 2013
require "CouchDB"

begin
	# Create a database that is the same name as my github handle
	server = CouchDB::Server.new "67.23.79.113", 5984
	database = CouchDB::Database.new server, "nteleky"
	database.delete_if_exists!
	database.create_if_missing!
rescue
	print "Database couldn't be created"

end

begin
	# Insert a document into the database
	document_one = CouchDB::Document.new database, "_id" => "Doc 1", "type" => "testdoc"
	document_two = CouchDB::Document.new database, "_id" => "Doc 2", "type" => "testdoc"
	document_one.save
	document_two.save
rescue
	print "documents couldn't be saved"
end
