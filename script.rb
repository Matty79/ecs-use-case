require 'mysql2'

client = Mysql2::Client.new(
  host: "localhost",
  username: "root",
  password: "ecs",
  database: "ecsdb",
)

  def get_filenames
    @filenames = Dir["/path/to/search/**/*.sql"]
  end

  def sort_filenames(filenames)
    @s_filenames = filenames.sort
  end

  def get_db_version
    @vnum = client.query("SELECT version FROM versionTable")
  end

  def identify_viable_scripts(vnum, s_filenames)
    @v_scripts = (s_filenames[-1].scan(/\d+/).first.to_i != vnum) ?
      @s_filenames.select do |x| @vnum < x.scan(/\d+/).first end :
      'Database is already up to date'
  end

    # next method should access viable scripts from folder and execute to db
    # how to compare with v_scripts array to do so?
  def run_viable_scripts(v_scripts)
    v_scripts.is_a?(Array)
    client.query("ecsdb < v_scripts")
  end

  def update_db_version_number(v_scripts)
    v_scripts.is_a?(Array)
    final_vnum = v_scripts[-1].scan(/\d+/).first.to_i
    client.query("REPLACE versionTable (version) VALUES (final_vnum)")
  end
