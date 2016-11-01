class CreateDianyuans < ActiveRecord::Migration
  def change
    create_table :dianyuans do |t|
      t.string :DYDM, null:false
      t.string :DYMC,null:false
      t.string :DYXB
      t.string :QDDM
      t.string :KHDM
      t.string :XZDM
      t.string :ZDZK
      t.string :QMM
      t.string :BZ
      t.string :BYZD1
      t.string :BYZD2
      t.string :BYZD3
      t.string :BYZD4
      t.string :ZJF
      t.string :KWDM
      t.string :PHONE
      t.string :MOBILE
      t.string :EMAIL
      t.datetime :BIRTHDAY
      t.string :EDUCATION
      t.string :ORIGIN
      t.string :IDENT_NO
      t.datetime :IN_DATE
      t.datetime :OUT_DATE
      t.string :ADDRESS
      t.string :OUT
      t.datetime :GWDDRQ
      t.string :BYZD5
      t.string :BYZD6
      t.string :BYZD7
      t.string :BYZD8
      t.string :BYZD9
      t.string :QDBZ
      t.timestamp :LastChanged

      t.timestamps null: true
    end
  end
end
